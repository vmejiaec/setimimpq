<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="AUD_PAR_AUDITORIA.aspx.cs" 
    Inherits="AUD_AUD_PAR_AUDITORIA" 
    meta:resourcekey="Tit_Aud_Par_AuditoriaRecursoKCG" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"%>

<%@ Register Src="../WebUserControls/wucMensajeActualizar.ascx" TagName="wucMensajeActualizar"
    TagPrefix="uc1" %>

<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>    
    
    
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server" 
        UpdateMode="Conditional">
     <ContentTemplate>
    
     
            <asp:FormView 
                ID="fvAudParAuditoria" 
                runat="server" 
                DataSourceID="odsFVAudParAuditoria"
                DefaultMode="Insert"  >
                
                <InsertItemTemplate>
                   <asp:Panel 
                        runat="server" 
                        ID="pnlPrincipal"
                        meta:resourcekey="Rec_Aud_Par_AuditoriaRecursoKCG">
                        <table>
                            <tr align="right">
                                <td>
                                     <asp:Label 
                                        ID="Estado_Nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                     </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        id="lblCodigo"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        id="lblInt_sucursal_Codigo"
                                        runat="server"
                                       Text='<%# GetLocalResourceObject("Int_Sucursal_NombreRecursoKCG.Text").ToString() %>'>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Int_sucursal_Codigo" 
                                        runat="server"
                                        ReadOnly="true" 
                                        ToolTip='<%# GetLocalResourceObject("Int_Sucursal_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_sucursal_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Int_Sucursal_Nombre" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("Int_Sucursal_NombreRecursoKCG.ToolTip").ToString() %>'  
                                        Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        id="lblModulo"
                                        runat="server"
                                       Text='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Dic_Modulo_Codigo" 
                                        runat="server" 
                                         ReadOnly="true"
                                        Text='<%# Bind("Dic_Modulo_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Dic_Modulo_Nombre" 
                                        runat="server"
                                         ReadOnly="true" 
                                         ToolTip='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Dic_Modulo_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                     <asp:Label 
                                        id="lblObjeto"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Dic_Objeto_Codigo" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("Dic_Objeto_CodigoRecursoKCG.ToolTip").ToString() %>'    
                                        Text='<%# Bind("Dic_Objeto_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Dic_Objeto_Nombre" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'  
                                        Text='<%# Bind("Dic_Objeto_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="pnlDatosIndividuales"
                    runat="server" 
                    meta:resourcekey="Rec_P_Individuales_Aud_Par_AuditoriaRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblIns" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="INS"
                                        Text='<%# GetLocalResourceObject("INSRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                     <asp:TextBox 
                                        ID="INS" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("INSRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("INS") %>'>
                                     </asp:TextBox>
                                    
                                    <asp:Label 
                                        ID="lblUPD" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("UPDRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="UPD" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("UPDRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("UPD") %>'>
                                     </asp:TextBox>
                                    <asp:Label 
                                        ID="lblDEL" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("DELRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="DEL" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("DELRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("DEL") %>'>
                                     </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        
                    </asp:Panel>
                    <asp:Panel runat="server"
                    id="pnlDatosSelect"
                    meta:resourcekey="Rec_P_Select_Aud_Par_AuditoriaRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                  <asp:Label 
                                        ID="lblUNI" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("UNIRecursoKCG.Text").ToString() %>' >
                                  </asp:Label> 
                                 <asp:TextBox 
                                        ID="UNI" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("UNIRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("UNI") %>'>
                                     </asp:TextBox>
                                    <asp:Label 
                                        ID="lblSEL" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("SELRecursoKCG.Text").ToString() %>' >
                                  </asp:Label> 
                                  
                                   <asp:TextBox 
                                        ID="SEL" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("SELRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("SEL") %>'>
                                     </asp:TextBox>
                                  
                                </td>
                            </tr>
                        </table>
                    
                    </asp:Panel>
                    <asp:Panel runat="server" ID="pnlDatosBloque"
                        meta:resourcekey="Rec_P_Bloque_Aud_Par_AuditoriaRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                <asp:Label 
                                        ID="lblBIN" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("BINRecursoKCG.Text").ToString() %>' >
                                  </asp:Label> 
                                 <asp:TextBox 
                                        ID="BIN" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("BINRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("BIN") %>'>
                                     </asp:TextBox>
                                     <asp:Label 
                                        ID="lblBUP" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("BUPRecursoKCG.Text").ToString() %>' >
                                  </asp:Label> 
                                     <asp:TextBox 
                                        ID="BUP" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("BUPRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("BUP") %>'>
                                     </asp:TextBox>
                                <asp:Label 
                                        ID="lblBDE" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("BDERecursoKCG.Text").ToString() %>' >
                                  </asp:Label> 
                                  
                               <asp:TextBox 
                                        ID="BDE" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("BDERecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("BDE") %>'>
                                     </asp:TextBox>
                                </td>
                                
                            </tr>
                        </table>
                        
                    </asp:Panel>
                    <asp:TextBox 
                        ID="Nombre" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Sucursal_Id" 
                        Visible="true"
                        Style="visibility:hidden"
                        runat="server" 
                        Text='<%# Bind("Int_Sucursal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id"
                        Visible="true"
                        Style="visibility:hidden" 
                        runat="server" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Dic_Modulo_Id" 
                        Visible="true"
                        Style="visibility:hidden"
                        runat="server" 
                        Text='<%# Bind("Dic_Modulo_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_empresa_Id" 
                        Visible="true"
                        Style="visibility:hidden"
                        runat="server" 
                        Text='<%# Bind("Int_empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Codigo" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Int_Moneda_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Dic_Objeto_Id" 
                        Visible="true"
                        Style="visibility:hidden"
                        runat="server" 
                        Text='<%# Bind("Dic_Objeto_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_id" 
                        Visible="true"
                        Style="visibility:hidden"
                        runat="server" 
                        Text='<%# Bind("Int_Moneda_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Nombre" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Int_Moneda_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>
                    
                </InsertItemTemplate>
                <ItemTemplate>
                     <asp:Panel 
                        runat="server" 
                        ID="pnlPrincipal"
                        meta:resourcekey="Rec_Aud_Par_AuditoriaRecursoKCG">
                        <table>
                            <tr align="right">
                                <td>
                                     <asp:Label 
                                        ID="Estado_Nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                     </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        id="lblCodigo"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        id="lblInt_sucursal_Codigo"
                                        runat="server"
                                       Text='<%# GetLocalResourceObject("Int_Sucursal_NombreRecursoKCG.Text").ToString() %>'>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Int_sucursal_Codigo" 
                                        runat="server"
                                        ReadOnly="true" 
                                        ToolTip='<%# GetLocalResourceObject("Int_Sucursal_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_sucursal_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Int_Sucursal_Nombre" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("Int_Sucursal_NombreRecursoKCG.ToolTip").ToString() %>'  
                                        Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        id="lblModulo"
                                        runat="server"
                                       Text='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Dic_Modulo_Codigo" 
                                        runat="server" 
                                         ReadOnly="true"
                                        Text='<%# Bind("Dic_Modulo_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Dic_Modulo_Nombre" 
                                        runat="server"
                                         ReadOnly="true" 
                                         ToolTip='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Dic_Modulo_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                     <asp:Label 
                                        id="lblObjeto"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Dic_Objeto_Codigo" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("Dic_Objeto_CodigoRecursoKCG.ToolTip").ToString() %>'    
                                        Text='<%# Bind("Dic_Objeto_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Dic_Objeto_Nombre" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'  
                                        Text='<%# Bind("Dic_Objeto_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="pnlDatosIndividuales"
                    runat="server" 
                    meta:resourcekey="Rec_P_Individuales_Aud_Par_AuditoriaRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblIns" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="INS"
                                        Text='<%# GetLocalResourceObject("INSRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                     <asp:TextBox 
                                        ID="INS" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("INSRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("INS") %>'>
                                     </asp:TextBox>
                                    
                                    <asp:Label 
                                        ID="lblUPD" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("UPDRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="UPD" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("UPDRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("UPD") %>'>
                                     </asp:TextBox>
                                    <asp:Label 
                                        ID="lblDEL" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("DELRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="DEL" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("DELRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("DEL") %>'>
                                     </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        
                    </asp:Panel>
                    <asp:Panel runat="server"
                    id="pnlDatosSelect"
                    meta:resourcekey="Rec_P_Select_Aud_Par_AuditoriaRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                  <asp:Label 
                                        ID="lblUNI" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("UNIRecursoKCG.Text").ToString() %>' >
                                  </asp:Label> 
                                 <asp:TextBox 
                                        ID="UNI" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("UNIRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("UNI") %>'>
                                     </asp:TextBox>
                                    <asp:Label 
                                        ID="lblSEL" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("SELRecursoKCG.Text").ToString() %>' >
                                  </asp:Label> 
                                  
                                   <asp:TextBox 
                                        ID="SEL" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("SELRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("SEL") %>'>
                                     </asp:TextBox>
                                  
                                </td>
                            </tr>
                        </table>
                    
                    </asp:Panel>
                    <asp:Panel runat="server" ID="pnlDatosBloque"
                        meta:resourcekey="Rec_P_Bloque_Aud_Par_AuditoriaRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                <asp:Label 
                                        ID="lblBIN" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("BINRecursoKCG.Text").ToString() %>' >
                                  </asp:Label> 
                                 <asp:TextBox 
                                        ID="BIN" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("BINRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("BIN") %>'>
                                     </asp:TextBox>
                                     <asp:Label 
                                        ID="lblBUP" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("BUPRecursoKCG.Text").ToString() %>' >
                                  </asp:Label> 
                                     <asp:TextBox 
                                        ID="BUP" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("BUPRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("BUP") %>'>
                                     </asp:TextBox>
                                <asp:Label 
                                        ID="lblBDE" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("BDERecursoKCG.Text").ToString() %>' >
                                  </asp:Label> 
                                  
                               <asp:TextBox 
                                        ID="BDE" 
                                        runat="server"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("BDERecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("BDE") %>'>
                                     </asp:TextBox>
                                </td>
                                
                            </tr>
                        </table>
                        
                    </asp:Panel>
                    <table>
                        <tr align="left">
                            <td>
                             <asp:Button 
                                                            ID="EditButton" 
                                                            runat="server"
                                                            CausesValidation="False" 
                                                            CommandName="Edit"
                                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                                        </asp:Button>
                            </td>
                        </tr>
                    
                    </table>
                    <asp:TextBox 
                        ID="Nombre" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Sucursal_Id" 
                        Visible="true"
                        Style="visibility:hidden"
                        runat="server" 
                        Text='<%# Bind("Int_Sucursal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id"
                        Visible="true"
                        Style="visibility:hidden" 
                        runat="server" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Dic_Modulo_Id" 
                        Visible="true"
                        Style="visibility:hidden"
                        runat="server" 
                        Text='<%# Bind("Dic_Modulo_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_empresa_Id" 
                        Visible="true"
                        Style="visibility:hidden"
                        runat="server" 
                        Text='<%# Bind("Int_empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Codigo" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Int_Moneda_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Dic_Objeto_Id" 
                        Visible="true"
                        Style="visibility:hidden"
                        runat="server" 
                        Text='<%# Bind("Dic_Objeto_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_id" 
                        Visible="true"
                        Style="visibility:hidden"
                        runat="server" 
                        Text='<%# Bind("Int_Moneda_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Nombre" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Int_Moneda_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>
                    
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Panel 
                        runat="server" 
                        ID="pnlPrincipal"
                        meta:resourcekey="Rec_Aud_Par_AuditoriaRecursoKCG">
                        <table>
                            <tr align="right">
                                <td>
                                     <asp:Label 
                                        ID="Estado_Nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                     </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        id="lblCodigo"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        id="lblInt_sucursal_Codigo"
                                        runat="server"
                                       Text='<%# GetLocalResourceObject("Int_Sucursal_NombreRecursoKCG.Text").ToString() %>'>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Int_sucursal_Codigo" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ReadOnly="true" 
                                        ToolTip='<%# GetLocalResourceObject("Int_Sucursal_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_sucursal_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Int_Sucursal_Nombre" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("Int_Sucursal_NombreRecursoKCG.ToolTip").ToString() %>'  
                                        Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        id="lblModulo"
                                        runat="server"
                                       Text='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Dic_Modulo_Codigo" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                         ReadOnly="true"
                                         
                                        Text='<%# Bind("Dic_Modulo_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Dic_Modulo_Nombre" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG"
                                         ReadOnly="true" 
                                         ToolTip='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Dic_Modulo_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                     <asp:Label 
                                        id="lblObjeto"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Dic_Objeto_Codigo" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("Dic_Objeto_CodigoRecursoKCG.ToolTip").ToString() %>'    
                                        Text='<%# Bind("Dic_Objeto_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Dic_Objeto_Nombre" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG"
                                         ReadOnly="true"
                                         ToolTip='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'  
                                        Text='<%# Bind("Dic_Objeto_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="pnlDatosIndividuales"
                    runat="server" 
                    meta:resourcekey="Rec_P_Individuales_Aud_Par_AuditoriaRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblIns" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="INS"
                                        Text='<%# GetLocalResourceObject("INSRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:DropDownList 
                                        ID="INS" 
                                        runat="server" 
                                        DataSourceID="odsINS" 
                                        DataTextField="Nombre"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("INSRecursoKCG.ToolTip").ToString() %>' 
                                        DataValueField="Dic_Dominio_Dominio" 
                                        SelectedValue='<%# Eval("INS") %>'>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsINS" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                            <asp:Parameter 
                                                DefaultValue="Nombre" 
                                                Name="sortExpression" 
                                                Type="String" />
                                            <asp:SessionParameter 
                                                Name="s" 
                                                SessionField="Scope" 
                                                Type="Object" />
                                            <asp:Parameter 
                                                DefaultValue="AUD_PAR_AUDITORIA" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="INS" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:Label 
                                        ID="lblUPD" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("UPDRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                    <asp:DropDownList 
                                        ID="UPD" 
                                        runat="server" 
                                        DataSourceID="odsUPD" 
                                        DataTextField="Nombre"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("UPDRecursoKCG.ToolTip").ToString() %>' 
                                        DataValueField="Dic_Dominio_Dominio" 
                                        SelectedValue='<%# Eval("UPD") %>'>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsUPD" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                            <asp:Parameter 
                                                DefaultValue="Nombre" 
                                                Name="sortExpression" 
                                                Type="String" />
                                            <asp:SessionParameter 
                                                Name="s" 
                                                SessionField="Scope" 
                                                Type="Object" />
                                            <asp:Parameter 
                                                DefaultValue="AUD_PAR_AUDITORIA" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="UPD" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:Label 
                                        ID="lblDEL" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("DELRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                    <asp:DropDownList 
                                        ID="DEL" 
                                        runat="server" 
                                        DataSourceID="odsDEL" 
                                        DataTextField="Nombre"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("DELRecursoKCG.ToolTip").ToString() %>' 
                                        DataValueField="Dic_Dominio_Dominio" 
                                        SelectedValue='<%# Eval("DEL") %>'>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsDEL" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                            <asp:Parameter 
                                                DefaultValue="Nombre" 
                                                Name="sortExpression" 
                                                Type="String" />
                                            <asp:SessionParameter 
                                                Name="s" 
                                                SessionField="Scope" 
                                                Type="Object" />
                                            <asp:Parameter 
                                                DefaultValue="AUD_PAR_AUDITORIA" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="DEL" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                        </table>
                        
                    </asp:Panel>
                    <asp:Panel runat="server"
                    id="pnlDatosSelect"
                    meta:resourcekey="Rec_P_Select_Aud_Par_AuditoriaRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                  <asp:Label 
                                        ID="lblUNI" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("UNIRecursoKCG.Text").ToString() %>' >
                                  </asp:Label> 
                                  <asp:DropDownList 
                                        ID="UNI" 
                                        runat="server" 
                                        DataSourceID="odsUNI" 
                                        DataTextField="Nombre"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("UNIRecursoKCG.ToolTip").ToString() %>' 
                                        DataValueField="Dic_Dominio_Dominio" 
                                        SelectedValue='<%# Eval("UNI") %>'>
                                    </asp:DropDownList>
                                  <asp:ObjectDataSource 
                                        ID="odsUNI" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                            <asp:Parameter 
                                                DefaultValue="Nombre" 
                                                Name="sortExpression" 
                                                Type="String" />
                                            <asp:SessionParameter 
                                                Name="s" 
                                                SessionField="Scope" 
                                                Type="Object" />
                                            <asp:Parameter 
                                                DefaultValue="AUD_PAR_AUDITORIA" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="UNI" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:Label 
                                        ID="lblSEL" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("SELRecursoKCG.Text").ToString() %>' >
                                  </asp:Label> 
                                  
                                   <asp:DropDownList 
                                        ID="SEL" 
                                        runat="server" 
                                        DataSourceID="odsSEL" 
                                        DataTextField="Nombre"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("SELRecursoKCG.ToolTip").ToString() %>' 
                                        DataValueField="Dic_Dominio_Dominio" 
                                        SelectedValue='<%# Eval("SEL") %>'>
                                    </asp:DropDownList>
                                  <asp:ObjectDataSource 
                                        ID="odsSEL" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                            <asp:Parameter 
                                                DefaultValue="Nombre" 
                                                Name="sortExpression" 
                                                Type="String" />
                                            <asp:SessionParameter 
                                                Name="s" 
                                                SessionField="Scope" 
                                                Type="Object" />
                                            <asp:Parameter 
                                                DefaultValue="AUD_PAR_AUDITORIA" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="SEL" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                  
                                </td>
                            </tr>
                        </table>
                    
                    </asp:Panel>
                    <asp:Panel runat="server" ID="pnlDatosBloque"
                        meta:resourcekey="Rec_P_Bloque_Aud_Par_AuditoriaRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                <asp:Label 
                                        ID="lblBIN" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("BINRecursoKCG.Text").ToString() %>' >
                                  </asp:Label> 
                                  
                                      <asp:DropDownList 
                                        ID="BIN" 
                                        runat="server" 
                                        DataSourceID="odsBIN" 
                                        DataTextField="Nombre"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("BINRecursoKCG.ToolTip").ToString() %>' 
                                        DataValueField="Dic_Dominio_Dominio" 
                                        SelectedValue='<%# Eval("BIN") %>'>
                                    </asp:DropDownList>
                                  <asp:ObjectDataSource 
                                        ID="odsBIN" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                            <asp:Parameter 
                                                DefaultValue="Nombre" 
                                                Name="sortExpression" 
                                                Type="String" />
                                            <asp:SessionParameter 
                                                Name="s" 
                                                SessionField="Scope" 
                                                Type="Object" />
                                            <asp:Parameter 
                                                DefaultValue="AUD_PAR_AUDITORIA" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="BIN" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                     <asp:Label 
                                        ID="lblBUP" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("BUPRecursoKCG.Text").ToString() %>' >
                                  </asp:Label> 
                                     <asp:DropDownList 
                                        ID="BUP" 
                                        runat="server" 
                                        DataSourceID="odsBUP" 
                                        DataTextField="Nombre"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("BUPRecursoKCG.ToolTip").ToString() %>' 
                                        DataValueField="Dic_Dominio_Dominio" 
                                        SelectedValue='<%# Eval("BUP") %>'>
                                    </asp:DropDownList>
                                     <asp:ObjectDataSource 
                                        ID="odsBUP" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                            <asp:Parameter 
                                                DefaultValue="Nombre" 
                                                Name="sortExpression" 
                                                Type="String" />
                                            <asp:SessionParameter 
                                                Name="s" 
                                                SessionField="Scope" 
                                                Type="Object" />
                                            <asp:Parameter 
                                                DefaultValue="AUD_PAR_AUDITORIA" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="BUP" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                <asp:Label 
                                        ID="lblBDE" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# GetLocalResourceObject("BDERecursoKCG.Text").ToString() %>' >
                                  </asp:Label> 
                                  
                                <asp:DropDownList 
                                        ID="BDE" 
                                        runat="server" 
                                        DataSourceID="odsBDE" 
                                        DataTextField="Nombre"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("BDERecursoKCG.ToolTip").ToString() %>' 
                                        DataValueField="Dic_Dominio_Dominio" 
                                        SelectedValue='<%# Eval("BDE") %>'>
                                    </asp:DropDownList>
                                     <asp:ObjectDataSource 
                                        ID="odsBDE" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                            <asp:Parameter 
                                                DefaultValue="Nombre" 
                                                Name="sortExpression" 
                                                Type="String" />
                                            <asp:SessionParameter 
                                                Name="s" 
                                                SessionField="Scope" 
                                                Type="Object" />
                                            <asp:Parameter 
                                                DefaultValue="AUD_PAR_AUDITORIA" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="BDE" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                                
                            </tr>
                        </table>
                        
                    </asp:Panel>
                    <table>
                        <tr align="left">
                            <td>
                             <asp:Button 
                                                                ID="UpdateButton" 
                                                                runat="server"
                                                                ValidationGroup="I" 
                                                                CausesValidation="True" 
                                                                CommandName="Update"
                                                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_ActualizarRecursoKCG.AccesKey").ToString() %>'
                                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_UpdateRecursoKCG.Text").ToString() %>'
                                                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_UpdateRecursoKCG.ToolTip").ToString() %>'>
                                                        </asp:Button>
                                                     <asp:Button 
                                                                ID="UpdateCancelButton" 
                                                                runat="server"
                                                                CausesValidation="False" 
                                                                CommandName="Cancel"
                                                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_CancelarRecursoKCG.AccesKey").ToString() %>' 
                                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                                     </asp:Button>
                                                    <uc1:wucMensajeActualizar ID="WucMensajeActualizar2" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <asp:TextBox 
                        ID="Nombre" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Sucursal_Id" 
                        Visible="true"
                        Style="visibility:hidden"
                        runat="server" 
                        Text='<%# Bind("Int_Sucursal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id"
                        Visible="true"
                        Style="visibility:hidden" 
                        runat="server" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Dic_Modulo_Id" 
                        Visible="true"
                        Style="visibility:hidden"
                        runat="server" 
                        Text='<%# Bind("Dic_Modulo_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_empresa_Id" 
                        Visible="true"
                        Style="visibility:hidden"
                        runat="server" 
                        Text='<%# Bind("Int_empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Codigo" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Int_Moneda_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Dic_Objeto_Id" 
                        Visible="true"
                        Style="visibility:hidden"
                        runat="server" 
                        Text='<%# Bind("Dic_Objeto_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_id" 
                        Visible="true"
                        Style="visibility:hidden"
                        runat="server" 
                        Text='<%# Bind("Int_Moneda_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Nombre" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Int_Moneda_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>
                    
                </EditItemTemplate>
    </asp:FormView>
            <koala:KNavegacion ID="nav"
                            runat="server"
                            GridViewID="gvAudParAuditoria"
                            FormViewID="FormView1" OnNavegar="nav_Siguiente" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvAudParAuditoria" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsFVAudParAuditoria" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetById" 
        SortParameterName="sortExpression"
        TypeName="FEL.AUD.BO_Aud_Par_Auditoria" 
        UpdateMethod="Update" DeleteMethod="Delete" InsertMethod="Insert">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:Parameter Name="Id" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:UpdatePanel 
        ID="UpdatePanel2" 
        runat="server">
        <ContentTemplate>
            <asp:Button 
                ID="Atras" 
                runat="server" 
                AccessKey="B"
                Visible="false"
                meta:resourceKey="Btn_Atras" />
            <asp:Button 
                ID="Seleccionar"
                runat="server" 
                AccessKey="S"
                Visible="false"
                meta:resourceKey="Btn_Seleccion"/>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel 
        ID="UpdatePanel3" 
        runat="server">
        <ContentTemplate>
        <koala:KFiltro ID="kftFiltro" 
            runat="server" 
            Contenedor="AUD_PAR_AUDITORIA" 
            Objeto="AUD_PAR_AUDITORIA" 
            IndiceScope ="Scope"
            Orden="1" ObjectDataSourceID="odsGVAudParAuditoria"/> 
        
        
        <asp:Panel 
            runat="server" 
            ID="DatosGrid" 
            meta:resourcekey="Rec_Listado_Aud_Par_AuditoriaRecursoKCG"
            AccessKey="L">
            <koala:KGrid 
                ID="gvAudParAuditoria" 
                runat="server" 
                AllowPaging="True" 
                AllowSorting="True"
                AutoGenerateColumns="False" 
                DataKeyNames="Id" 
                AccessKey="L"
                DataSourceID="odsGVAudParAuditoria">
                
                <AlternatingRowStyle CssClass="alternatingrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <PagerStyle CssClass="pagerstyle" />

                <Columns>
                    <asp:CommandField 
                        ButtonType="Button" 
                        SelectText="..." 
                        ShowSelectButton="True" />
                    <asp:BoundField 
                        DataField="Codigo" 
                        meta:resourcekey="BoundCodigoRecursoKCG"
                        SortExpression="Codigo_int" />
                    <asp:BoundField 
                        DataField="INS" 
                        meta:resourcekey="BoundINSRecursoKCG"
                        SortExpression="INS" />
                    <asp:BoundField 
                        DataField="UPD" 
                        meta:resourcekey="BoundUPDRecursoKCG"
                        SortExpression="UPD" />
                    <asp:BoundField 
                        DataField="DEL" 
                        meta:resourcekey="BoundDELRecursoKCG" 
                        SortExpression="DEL" />
                    <asp:BoundField 
                        DataField="SEL" 
                        meta:resourcekey="BoundSELRecursoKCG" 
                        SortExpression="SEL" />
                    <asp:BoundField 
                        DataField="UNI" 
                        meta:resourcekey="BoundUNIRecursoKCG"  
                        SortExpression="UNI" />
                    <asp:BoundField 
                        DataField="BUP" 
                        meta:resourcekey="BoundBUPRecursoKCG"   
                        SortExpression="BUP" />
                    <asp:BoundField 
                        DataField="BIN" 
                        meta:resourcekey="BoundBINRecursoKCG"   
                        SortExpression="BIN" />
                    <asp:BoundField 
                        DataField="BDE" 
                        meta:resourcekey="BoundBDERecursoKCG"    
                        SortExpression="BDE" />
                    <asp:BoundField 
                        DataField="Int_Sucursal_Nombre" 
                        meta:resourcekey="BoundInt_Sucursal_NombreRecursoKCG"  
                        SortExpression="Int_Sucursal_Nombre" />
                    <asp:BoundField 
                        DataField="Dic_Modulo_Nombre" 
                        meta:resourcekey="BoundDic_Modulo_NombreRecursoKCG"   
                        SortExpression="Dic_Modulo_Nombre" />
                    <asp:BoundField 
                        DataField="Dic_Objeto_Nombre" 
                        meta:resourcekey="BoundDic_Objeto_NombreRecursoKCG"    
                        SortExpression="Dic_Objeto_Nombre" />
                    <asp:BoundField 
                        DataField="Nombre" 
                        HeaderText="Nombre" 
                        SortExpression="Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Empresa_Nombre" 
                        HeaderText="Int_Empresa_Nombre" 
                        SortExpression="Int_Empresa_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado_Nombre" 
                        HeaderText="Estado_Nombre" 
                        SortExpression="Estado_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Sucursal_Id" 
                        HeaderText="Int_Sucursal_Id" 
                        SortExpression="Int_Sucursal_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Id" 
                        HeaderText="Id" 
                        SortExpression="Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Dic_Objeto_Codigo" 
                        HeaderText="Dic_Objeto_Codigo" 
                        SortExpression="Dic_Objeto_Codigo"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Dic_Modulo_Codigo" 
                        HeaderText="Dic_Modulo_Codigo" 
                        SortExpression="Dic_Modulo_Codigo"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_sucursal_Codigo" 
                        HeaderText="Int_sucursal_Codigo"
                        SortExpression="Int_sucursal_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Dic_Modulo_Id" 
                        HeaderText="Dic_Modulo_Id" 
                        SortExpression="Dic_Modulo_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_empresa_Id" 
                        HeaderText="Int_empresa_Id" 
                        SortExpression="Int_empresa_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Moneda_Codigo" 
                        HeaderText="Int_Moneda_Codigo" 
                        SortExpression="Int_Moneda_Codigo"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado" 
                        HeaderText="Estado" 
                        SortExpression="Estado" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Dic_Objeto_Id" 
                        HeaderText="Dic_Objeto_Id" 
                        SortExpression="Dic_Objeto_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Moneda_id" 
                        HeaderText="Int_Moneda_id" 
                        SortExpression="Int_Moneda_id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Moneda_Nombre" 
                        HeaderText="Int_Moneda_Nombre" 
                        SortExpression="Int_Moneda_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Empresa_Codigo" 
                        HeaderText="Int_Empresa_Codigo" 
                        SortExpression="Int_Empresa_Codigo"
                        Visible="False" />
                </Columns>
            </koala:KGrid>
        </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsGVAudParAuditoria" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.AUD.BO_Aud_Par_Auditoria">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>

