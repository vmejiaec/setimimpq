<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="FIS_PRESUPUESTO_PROYECTO.aspx.cs" 
    Inherits="FIS_FIS_PRESUPUESTO_PROYECTO" 
    meta:resourcekey="Tit_Fis_Presupuesto_ProyectoRecursoKCG" %>

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
                ID="NumRegistros"
                runat="server" 
                style="display:none">
            </asp:TextBox>
            
            <asp:TextBox 
                ID="Pagina" 
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
                            
                                ID="lbl_CodCosto" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Apu_Origen_CodigoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lbl_CodInst" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lbl_FechaI" 
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
                                ID="lbl_FechaF" 
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
                                ID="txt_CodCosto" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Apu_Origen_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="txt_CodInts"                                 
                                runat="server"
                                Width="170px"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="txt_FechaI" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Fecha_Ini_ContratoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="txt_Plazo" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                style="text-align:right"
                                ToolTip='<%# GetLocalResourceObject("Plazo_ContratoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="txt_FechaF" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Apu_Origen_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="txt_Estado" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Estado_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Proy" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Apu_Origen_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox 
                                ID="txt_Proy" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                Width="800px"
                                Height="50px"
                                TextMode="MultiLine"                                
                                Font-Names="Arial"
                                ToolTip='<%# GetLocalResourceObject("Apu_Origen_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                      <td>
                            <asp:Label 
                                ID="lbl_Monto" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("MontoRecursoKCG.Text").ToString() %>'>
                            </asp:Label> 
                         </td>                         
                         <td>
                            <asp:TextBox 
                                ID="txt_Monto" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                style="text-align:right"
                                ToolTip='<%# GetLocalResourceObject("MontoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>          
                    </tr>
                   
                </table>
            </asp:Panel>
            <asp:Panel 
                ID="pnl_Listado" 
                runat="server" 
                meta:resourcekey="Rec_Fis_ListadoRecursoKCG" >
                <Koala:KGridBase
                    ID="Gv_Fis_Presupuesto_Proyecto" 
                    runat="server" 
                    AllowPaging="True"
                    AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id" 
                    DataSourceID="odsGv_Fis_Presupuesto_Proyecto"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' MostrarPaginacionSiempre="True">
                    <AlternatingRowStyle CssClass="alternatingrowstyle" />
                    <HeaderStyle CssClass="headerstyle" />
                    <PagerStyle CssClass="pagerstyle" />
                    <SelectedRowStyle CssClass="selectedrowstyle"/>
                    <Columns>   
                        <asp:CommandField 
                            ButtonType="Button" 
                            SelectText="..." 
                            ShowSelectButton="True" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Codigo" 
                            meta:resourcekey="BoundApu_Rubro_CodigoRecursoKCG"  
                            SortExpression="Apu_Rubro_Codigo">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Rubro_Nombre" 
                            meta:resourcekey="BoundApu_Rubro_NombreRecursoKCG" 
                            SortExpression="Apu_Rubro_Nombre">
                            <ItemStyle Width="80mm" Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Rubro_Unidad" 
                            meta:resourcekey="BoundApu_Rubro_UnidadRecursoKCG" 
                            SortExpression="Apu_Rubro_Unidad">
                            <ItemStyle Width="40mm" Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Rubro_Cantidad" 
                            meta:resourcekey="BoundApu_Rubro_CantidadRecursoKCG" 
                            SortExpression="Apu_Rubro_Cantidad"
                            dataformatstring="{0:N2}" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Unitario" 
                            meta:resourcekey="BoundCosto_UnitarioRecursoKCG"  
                            SortExpression="Costo_Unitario"
                            dataformatstring="{0:N2}" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Total" 
                            meta:resourcekey="BoundCosto_TotalRecursoKCG" 
                            SortExpression="Costo_Total"
                            dataformatstring="{0:N2}" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Descripcion" 
                            HeaderText="Descripcion" 
                            SortExpression="Descripcion"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Presupuesto_Id" 
                            HeaderText="Apu_Presupuesto_Id" 
                            SortExpression="Apu_Presupuesto_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_id" 
                            HeaderText="Apu_Rubro_id" 
                            SortExpression="Apu_Rubro_id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Subtitulo_Id" 
                            HeaderText="Apu_Subtitulo_Id" 
                            SortExpression="Apu_Subtitulo_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Subtitulo_Codigo" 
                            HeaderText="Apu_Subtitulo_Codigo"
                            SortExpression="Apu_Subtitulo_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Subtitulo_Nombre" 
                            HeaderText="Apu_Subtitulo_Nombre"
                            SortExpression="Apu_Subtitulo_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Titulo_id" 
                            HeaderText="Apu_Titulo_id" 
                            SortExpression="Apu_Titulo_id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Titulo_Codigo" 
                            HeaderText="Apu_Titulo_Codigo" 
                            SortExpression="Apu_Titulo_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Titulo_Nombre" 
                            HeaderText="Apu_Titulo_Nombre" 
                            SortExpression="Apu_Titulo_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Origen_Id" 
                            HeaderText="Apu_Origen_Id" 
                            SortExpression="Apu_Origen_Id"
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
                </Koala:KGridBase>
                <asp:ObjectDataSource 
                    ID="odsGv_Fis_Presupuesto_Proyecto" 
                    runat="server" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetByPresupuestoPF"
                    TypeName="FEL.APU.BO_Apu_Presupuesto_Rubro">
                    <SelectParameters>
                        <asp:SessionParameter 
                            Name="s" 
                            SessionField="Scope" 
                            Type="Object" />
                        <asp:QueryStringParameter 
                            Name="Apu_Presupuesto_Id" 
                            QueryStringField="Apu_Presupuesto_Id"
                            Type="String" />
                        <asp:Parameter 
                            Name="Estado" 
                            Type="String"
                            DefaultValue="DIS" />
                        <asp:Parameter 
                            Name="Apu_Rubro_Codigo" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Apu_Rubro_Nombre" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Apu_Rubro_Cantidad_Desde" 
                            Type="Decimal" />
                        <asp:Parameter 
                            Name="Apu_Rubro_Cantidad_Hasta" 
                            Type="Decimal" />
                    </SelectParameters>
                </asp:ObjectDataSource>    
            </asp:Panel>
            <table>
                <tr>
                    <td>
                        <koala:KFiltro 
                            ID="kftFiltro" 
                            runat="server" 
                            Contenedor="FIS_PRESUPUESTO_PROYECTO" 
                            Objeto="Apu_Presupuesto_Rubro" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsGv_Fis_Presupuesto_Proyecto"
                            PaginacionFina="true"/>
                    </td>
                    <td>
                        <asp:Button 
                            ID="Btn_Fis_Fiscalizacion" 
                            runat="server" 
                            meta:resourcekey="Btn_Fis_FiscalizacionRecursoKCG"
                            OnClick="Btn_Fis_Fiscalizacion_Click" />
                    </td>
                    <td>
                        <asp:Button 
                            ID="Btn_Apu_Presupuesto_Formula" 
                            runat="server" 
                            meta:resourcekey="Btn_Apu_Presupuesto_FormulaRecursoKCG"
                            OnClick="Btn_Apu_Presupuesto_Formula_Click" />
                    </td>  
                    <td>
                        <asp:Button 
                            ID="Btn_Apu_Presupuesto_CuadrillaRecursoKCG" 
                            runat="server" 
                            meta:resourcekey="Btn_Apu_Presupuesto_CuadrillaRecursoKCG"
                            OnClick="Btn_Apu_Presupuesto_Cuadrilla_Click"/>
                    </td>  
                    <td>
                        <asp:Button
                            ID="Btn_Formula_Definitiva"
                            runat="server"
                            meta:resourcekey="Btn_Fis_Formula_DefinitivaRecursoKCG"
                            OnClick="Btn_Formula_Definitiva_Click" />
                    </td> 
                    <td>
                        <asp:Button
                            ID="Btn_Cuadrilla_Definitiva"
                            runat="server"
                            meta:resourcekey="Btn_Fis_Cuadrilla_DefinitivaRecursoKCG"
                            OnClick="Btn_Cuadrilla_Definitiva_Click" />
                    </td> 
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>        
</asp:Content>

