<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PRESUPUESTO_FORMULA.aspx.cs" 
    Inherits="APU_APU_PRESUPUESTO_FORMULA" 
    Title="Untitled Page" 
    meta:resourcekey="Tit_Apu_Presupuesto_FormulaRecursoKCG" %>

<%@ Register 
    Assembly="AjaxControlToolkit" 
    Namespace="AjaxControlToolkit" 
    TagPrefix="AjaxControlToolkit" %>

<%@ Register 
    tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>
    
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server">
        <ContentTemplate>
            <asp:TextBox
                ID="txt_Estado"
                runat="server"
                style="display:none">
            </asp:TextBox>
            <asp:Panel
                ID="pnl_Proyecto"
                runat="server"
                meta:resourcekey="Rec_Fis_ProyectoRecursoKCG">
                <table>
                    <tr>
                        <td>
                            <asp:Label
                                ID="lbl_Codigo"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Origen_CodigoRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label
                                ID="lbl_Cod_Institucional"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label
                                ID="lbl_Fecha_Inicio"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Fecha_Ini_ContratoRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label
                                ID="lbl_Plazo"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Plazo_ContratoRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label
                                ID="lbl_fecha_Fin"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Fecha_Fin_ContratoRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label
                                ID="lbl_Estado"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Estado_NombreRecursoKCG.Text").ToString() %>'> 
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox
                                ID="Apu_Origen_Codigo"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                Tooltip='<%# GetLocalResourceObject("Apu_Origen_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Codigo_Institucion"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                Tooltip='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Fecha_Ini_Contrato"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                Tooltip='<%# GetLocalResourceObject("Fecha_Ini_ContratoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Plazo_Contrato"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                style="text-align:right"
                                Tooltip='<%# GetLocalResourceObject("Plazo_ContratoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Fecha_Fin_Contrato"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                Tooltip='<%# GetLocalResourceObject("Fecha_Fin_ContratoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Estado_Nombre"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                Tooltip='<%# GetLocalResourceObject("Estado_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Label
                                ID="lbl_Apu_Origen_Nombre"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Origen_NombreRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>
                  </tr>
                  <tr>
                        <td colspan="6">
                            <asp:TextBox
                                ID="Apu_Origen_Nombre"
                                runat="server"
                                Width="700px"
                                Height="50px"
                                ReadOnly="true"
                                TabIndex="-1"
                                TextMode="MultiLine"
                                Font-Names="Arial"
                                Tooltip='<%# GetLocalResourceObject("Apu_Origen_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label
                                ID="lbl_fIndices_Base"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Fecha_Indice_BaseRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox
                                ID="Fecha_Indice_Base"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                Tooltip='<%# GetLocalResourceObject("Fecha_Indice_BaseRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label
                                ID="lbl_Publicacion_Base"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Publicacion_BaseRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                            <asp:TextBox
                                ID="Publicacion_Base"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                Width="400px"
                                Tooltip='<%# GetLocalResourceObject("Publicacion_BaseRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label
                                ID="lbl_Coeficiente_Sumatoria"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Coeficiente_SumatoriaRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                            <asp:TextBox
                                ID="Coeficiente_Sumatoria"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                 Width="80"
                                style="text-align:right"
                                Tooltip='<%# GetLocalResourceObject("Coeficiente_SumatoriaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel 
                ID="pnl_Listado" 
                runat="server" 
                meta:resourcekey="Rec_Apu_Presupuesto_Formula_ListadoRecursoKCG">
                <koala:KGrid
                    ID="Gv_Apu_Presupuesto_Formula" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False"
                    DataKeyNames="Id" 
                    DataSourceID="odsGv_Apu_Presupuesto_Formula"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' >
                        <AlternatingRowStyle CssClass="alternatingrowstyle" />
                        <HeaderStyle CssClass="headerstyle" />
                        <PagerStyle CssClass="pagerstyle" />
                        <SelectedRowStyle CssClass="selectedrowstyle" />
                    <Columns>
                        <asp:CommandField 
                            ButtonType="Button" 
                            SelectText="..." 
                            ShowSelectButton="True" />
                        <asp:BoundField 
                            DataField="Apu_Indice_Codigo" 
                            meta:resourcekey="BoundApu_Indice_CodigoRecursoKCG"
                            SortExpression="Apu_Indice_Codigo">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Indice_Nombre" 
                            meta:resourcekey="BoundApu_Indice_NombreRecursoKCG"
                            SortExpression="Apu_Indice_Nombre">
                            <ItemStyle HorizontalAlign="Left" Width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Actual" 
                            meta:resourcekey="BoundCosto_ActualRecursoKCG"
                            SortExpression="Costo_Actual"
                            DataFormatString="{0:N4}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Letra" 
                            meta:resourcekey="BoundLetraRecursoKCG"
                            SortExpression="Letra">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Coeficiente" 
                            meta:resourcekey="BoundCoeficienteRecursoKCG"
                            SortExpression="Coeficiente" 
                            DataFormatString="{0:N3}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Presupuesto_Id" 
                            HeaderText="Apu_Presupuesto_Id" 
                            SortExpression="Apu_Presupuesto_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Indice_Id" 
                            HeaderText="Apu_Indice_Id" 
                            SortExpression="Apu_Indice_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Costo_Total" 
                            HeaderText="Costo_Total" 
                            SortExpression="Costo_Total"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Codigo" 
                            HeaderText="Codigo" 
                            SortExpression="Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Codigo_int" 
                            HeaderText="Codigo_int" 
                            SortExpression="Codigo_int"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Nombre" 
                            HeaderText="Nombre" 
                            SortExpression="Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False" />
                    </Columns>
                </koala:KGrid>
                <asp:ObjectDataSource 
                    ID="odsGv_Apu_Presupuesto_Formula" 
                    runat="server" ConflictDetection="CompareAllValues"
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetByPresupuesto"
                    TypeName="FEL.APU.BO_Apu_Presupuesto_Formula">
                    <SelectParameters>
                        <asp:SessionParameter 
                            Name="s" 
                            SessionField="Scope" 
                            Type="Object" />
                        <asp:QueryStringParameter 
                            Name="Apu_Presupuesto_Id" 
                            QueryStringField="Apu_Presupuesto_Id"
                            Type="String" />
                        <asp:ControlParameter 
                            ControlID="txt_Estado" 
                            Name="Estado" 
                            PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
            <table>
                <tr>
                    <td>
                        <koala:KFiltro 
                            ID="kftFiltro" 
                            runat="server" 
                            Contenedor="APU_PRESUPUESTO_FORMULA" 
                            Objeto="Apu_Presupuesto_Formula" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsGv_Apu_Presupuesto_Formula"
                            PaginacionFina="false"/>
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Presupuesto"
                            runat="server"
                            meta:resourcekey="Btn_Fis_Presupuesto_ProyectoRecursoKCG"
                            OnClick="Btn_Presupuesto_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Cuadrilla"
                            runat="server"
                            meta:resourcekey="Btn_Apu_Presupuesto_CuadrillaRecursoKCG"
                            OnClick="Btn_Cuadrilla_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Cuadrilla_Definitiva"
                            runat="server"
                            meta:resourcekey="Btn_Apu_Presupuesto_Cuadrilla_DefRecursoKCG" 
                            OnClick="Btn_Cuadrilla_Click"/>
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Publicacion"
                            runat="server"
                            meta:resourcekey="Btn_Apu_Presupuesto_Obtener_PublicacionRecursoKCG"
                            OnClick="Btn_Publicacion_Click" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

