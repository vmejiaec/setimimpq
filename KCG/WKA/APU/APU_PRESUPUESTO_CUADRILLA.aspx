<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PRESUPUESTO_CUADRILLA.aspx.cs" 
    Inherits="APU_APU_PRESUPUESTO_CUADRILLA" 
    Title="Untitled Page" 
    meta:resourcekey="Tit_Apu_Presupuesto_CuadrillaRecursoKCG" %>

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
                                ID="lbl_Apu_Codigo"                                   
                                runat="server"
                                style="text-align:right"
                                Text='<%# GetLocalResourceObject("Apu_Origen_CodigoRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label
                                ID="lbl_Cod_Institucional"                                   
                                runat="server"
                                style="text-align:right"
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
                                style="text-align:right"
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
                                style="text-align:right"
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
                                style="text-align:right"
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
                                 Width="80"
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
                                ReadOnly="true"
                                TabIndex="-1"
                                Height="50px"
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
                        </td>
                        <td>
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
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label
                                ID="lbl_Sumatoria"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Cuadrilla_Coeficiente_SumatoriaRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Cuadrilla_Coeficiente_Sumatoria"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                style="text-align:right"
                                Tooltip='<%# GetLocalResourceObject("Cuadrilla_Coeficiente_SumatoriaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                          </td>
                          <td>
                            <asp:TextBox
                                ID="SRD_x_Coeficiente_Sumatoria"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                style="text-align:right"
                                Tooltip='<%# GetLocalResourceObject("SRD_x_Coeficiente_SumatoriaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:TextBox
                                ID="SRD_x_Coeficiente_Sumatoria_Rea"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                style="text-align:right"
                                Tooltip='<%# GetLocalResourceObject("SRD_x_Coeficiente_SumatoriaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel 
                ID="pnl_Listado" 
                runat="server" 
                meta:resourcekey="Rec_Fis_ListadoRecursoKCG">
                 <koala:KGrid
                    ID="Gv_Apu_Presupuesto_Cuadrilla" 
                    runat="server" 
                    AllowPaging="True"
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id" 
                    DataSourceID="odsGv_Apu_Presupuesto_Cuadrilla"
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
                            DataField="Origen_Codigo" 
                            meta:resourcekey="BoundOrigen_CodigoRecursoKCG"
                            SortExpression="Origen_Codigo">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Origen_Nombre" 
                            meta:resourcekey="BoundOrigen_NombreRecursoKCG"
                            SortExpression="Origen_Nombre">
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
                            DataField="Coeficiente" 
                            meta:resourcekey="BoundCoeficienteRecursoKCG"
                            SortExpression="Coeficiente"
                            DataFormatString="{0:N3}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="SRD_x_Coeficiente" 
                            meta:resourcekey="BoundSRD_x_Coeficiente_SumatoriaRecursoKCG"
                            SortExpression="SRD_x_Coeficiente"
                            DataFormatString="{0:N4}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Presupuesto_Id" 
                            HeaderText="Apu_Presupuesto_Id" 
                            SortExpression="Apu_Presupuesto_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Origen" 
                            HeaderText="Origen" 
                            SortExpression="Origen" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Origen_Id" 
                            HeaderText="Origen_Id" 
                            SortExpression="Origen_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Costo_Total" 
                            HeaderText="Costo_Total" 
                            SortExpression="Costo_Total"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Salario_Real" 
                            HeaderText="Salario_Real" 
                            SortExpression="Salario_Real"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Numero_Trabajadores" 
                            HeaderText="Numero_Trabajadores"
                            SortExpression="Numero_Trabajadores" 
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
                    ID="odsGv_Apu_Presupuesto_Cuadrilla" 
                    runat="server" 
                    OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetByPresupuesto" 
                    TypeName="FEL.APU.BO_Apu_Presupuesto_Cuadrilla">
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
                            Contenedor="APU_PRESUPUESTO_CUADRILLA" 
                            Objeto="Apu_Presupuesto_Cuadrilla" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsGv_Apu_Presupuesto_Cuadrilla"
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
                            ID="Btn_Formula_Provisional"
                            runat="server"
                            meta:resourcekey="Btn_Apu_Presupuesto_FormulaRecursoKCG"
                            OnClick="Btn_Formula_Provisional_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Formula_Definitiva"
                            runat="server"
                            meta:resourcekey="Btn_Apu_Presupuesto_Formula_DefRecursoKCG"
                            OnClick="Btn_Formula_Provisional_Click" />
                    </td>                 
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

