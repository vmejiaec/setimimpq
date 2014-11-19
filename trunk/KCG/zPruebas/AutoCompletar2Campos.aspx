

<%--[0]INICIO Javascript para manegar los campos de autocompletar --%>
<script type="text/javascript" >
    function acxPer_Personal_CodigoTextBox_Click (source, eventArgs) {
        //alert(" Key : " + eventArgs.get_text() + "  Value :  " + eventArgs.get_value());
        var params = new Array();
        params = eventArgs.get_value().split('||');
        // 0 Id
        var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvCom_Contrato_Per_Personal_IdTextBox');
        xId.value = params[0];
        // 2 Nombre
        var xNombre = document.getElementById('ctl00_ContentPlaceHolder1_fvCom_Contrato_Per_Personal_NombreTextBox');
        xNombre.value = params[2];
    }
    function acxPer_Personal_NombreTextBox_Click (source, eventArgs) {
        //alert(" Key : " + eventArgs.get_text() + "  Value :  " + eventArgs.get_value());
        var params = new Array();
        params = eventArgs.get_value().split('||');
        // 0 Id
        var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvCom_Contrato_Per_Personal_IdTextBox');
        xId.value = params[0];
        // 1 Codigo
        var xCodigo = document.getElementById('ctl00_ContentPlaceHolder1_fvCom_Contrato_Per_Personal_CodigoTextBox');
        xCodigo.value = params[1];
    }
</script>
<%--[X]FIN Javascript para manegar los campos de autocompletar --%>

<%--[O]INICIO Control Ajax para pegar cerca de los Campos --%>
<ajax:AutoCompleteExtender 
    runat="server" ID= "acxPer_Personal_CodigoTextBox"
    BehaviorID= "acxBIDPer_Personal_CodigoTextBox"
    TargetControlID= "Per_Personal_CodigoTextBox"
    ServiceMethod= "acxPer_Personal_GetByLikeCodigo_List"
    UseContextKey="True" 
    ContextKey=""
    CompletionInterval="0"
    OnClientItemSelected= "acxPer_Personal_CodigoTextBox_Click"
    />
<ajax:AutoCompleteExtender 
    runat="server" ID= "acxPer_Personal_NombreTextBox"
    BehaviorID= "acxBIDPer_Personal_NombreTextBox"
    TargetControlID= "Per_Personal_NombreTextBox"
    ServiceMethod= "acxPer_Personal_GetByLikeNombre_List"
    UseContextKey="True" 
    ContextKey=""
    CompletionInterval="0"
    MinimumPrefixLength="0"
    OnClientItemSelected= acxPer_Personal_NombreTextBox_Click
    />
<%--[X]FIN Control Ajax para pegar cerca de los Campos --%>

// WebServices para autocompletar campos del FormView de Per_Personal
#region WebServices para autocompletar
[System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
public static string[] acxPer_Personal_GetByLikeCodigo_List (string prefixText, int count, string contextKey)
{
    Scope s = (Scope)HttpContext.Current.Session["Scope"];
    FEL.PLA.BO_Per_Personal adp = new BO_Per_Personal();
    var lista = adp.GetByLikeCodigo(s, contextKey, prefixText);
    //
    List<string> items = new List<string>();
    foreach (var fila in lista)
        items.Add(
            AjaxControlToolkit.AutoCompleteExtender.
                CreateAutoCompleteItem(
                    fila.Codigo, fila.Id + "||" + fila.Codigo + "||" + fila.Nombre  // 0 1 2
                ));
    return items.ToArray();
}
[System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
public static string[] acxPer_Personal_GetByLikeNombre_List (string prefixText, int count, string contextKey)
{
    Scope s = (Scope)HttpContext.Current.Session["Scope"];
    FEL.PLA.BO_Per_Personal adp = new BO_Per_Personal();
    var lista = adp.GetByLikeNombre(s, contextKey, prefixText);
    //
    List<string> items = new List<string>();
    foreach (var fila in lista)
        items.Add(
            AjaxControlToolkit.AutoCompleteExtender.
                CreateAutoCompleteItem(
                    fila.Nombre, fila.Id + "||" + fila.Codigo + "||" + fila.Nombre // 0 1 2
                ));
    return items.ToArray();
}
#endregion WebServices para autocompletar

// Eventos para Inicializar los ContextKey antes de dibujar el FormView
protected void fvPla_Tarea_PreRender(object sender, EventArgs e)
{
    FormView fvSender = (FormView) sender;
    AjaxControlToolkit.AutoCompleteExtender acxPer_Personal_CodigoTextBox = new AjaxControlToolkit.AutoCompleteExtender();
    AjaxControlToolkit.AutoCompleteExtender acxPer_Personal_NombreTextBox  = new AjaxControlToolkit.AutoCompleteExtender();
    switch (fvPla_Tarea.CurrentMode)
    {
        case FormViewMode.Insert:
            // Pone el año en el autocompletar
            acxPer_Personal_CodigoTextBox = (AjaxControlToolkit.AutoCompleteExtender)fvSender.FindControl(acxPer_Personal_CodigoTextBox);
            acxPer_Personal_CodigoTextBox.ContextKey = ddlCabecera.SelectedValue;
            acxPer_Personal_NombreTextBox = (AjaxControlToolkit.AutoCompleteExtender)fvSender.FindControl(acxPer_Personal_NombreTextBox);
            acxPer_Personal_NombreTextBox.ContextKey = ddlCabecera.SelectedValue;
            break;
        case FormViewMode.Edit:
            // Pone el año en el autocompletar
            acxPer_Personal_CodigoTextBox = (AjaxControlToolkit.AutoCompleteExtender) fvSender.FindControl(acxPer_Personal_CodigoTextBox);
            acxPer_Personal_CodigoTextBox.ContextKey = ddlCabecera.SelectedValue;
            acxPer_Personal_NombreTextBox = (AjaxControlToolkit.AutoCompleteExtender)fvSender.FindControl(acxPer_Personal_NombreTextBox);
            acxPer_Personal_NombreTextBox.ContextKey = ddlCabecera.SelectedValue;
            break;
        case FormViewMode.ReadOnly:
            break;
    }
}