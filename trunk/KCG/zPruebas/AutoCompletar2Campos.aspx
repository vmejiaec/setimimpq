

<%--[0]INICIO Javascript para manegar los campos de autocompletar --%>
<script type="text/javascript" >
    function acxPla_Partida_CodigoTextBox_Click (source, eventArgs) {
        //alert(" Key : " + eventArgs.get_text() + "  Value :  " + eventArgs.get_value());
        var params = new Array();
        params = eventArgs.get_value().split('||');
        // 0 Id
        var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Poa_Pla_Partida_IdTextBox');
        xId.value = params[0];
        // 2 Nombre
        var xNombre = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Poa_Pla_Partida_NombreTextBox');
        xNombre.value = params[2];
    }
    function acxPla_Partida_NombreTextBox_Click (source, eventArgs) {
        //alert(" Key : " + eventArgs.get_text() + "  Value :  " + eventArgs.get_value());
        var params = new Array();
        params = eventArgs.get_value().split('||');
        // 0 Id
        var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Poa_Pla_Partida_IdTextBox');
        xId.value = params[0];
        // 1 Codigo
        var xCodigo = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Poa_Pla_Partida_CodigoTextBox');
        xCodigo.value = params[1];
    }
</script>
<%--[X]FIN Javascript para manegar los campos de autocompletar --%>

<%--[O]INICIO Control Ajax para pegar cerca de los Campos --%>
<ajax:AutoCompleteExtender 
    runat="server" ID= "acxPla_Partida_CodigoTextBox"
    BehaviorID= "acxBIDPla_Partida_CodigoTextBox"
    TargetControlID= "Pla_Partida_CodigoTextBox"
    ServiceMethod= "acxPla_Partida_GetByLikeCodigo_List"
    UseContextKey="True" 
    ContextKey=""
    CompletionInterval="0"
    OnClientItemSelected= "acxPla_Partida_CodigoTextBox_Click"
    />
<ajax:AutoCompleteExtender 
    runat="server" ID= "acxPla_Partida_NombreTextBox"
    BehaviorID= "acxBIDPla_Partida_NombreTextBox"
    TargetControlID= "Pla_Partida_NombreTextBox"
    ServiceMethod= "acxPla_Partida_GetByLikeNombre_List"
    UseContextKey="True" 
    ContextKey=""
    CompletionInterval="0"
    MinimumPrefixLength="0"
    OnClientItemSelected= acxPla_Partida_NombreTextBox_Click
    />
<%--[X]FIN Control Ajax para pegar cerca de los Campos --%>

// WebServices para autocompletar campos del FormView de Pla_Partida
#region WebServices para autocompletar
[System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
public static string[] acxPla_Partida_GetByLikeCodigo_List (string prefixText, int count, string contextKey)
{
    Scope s = (Scope)HttpContext.Current.Session["Scope"];
    FEL.PLA.BO_Pla_Partida adp = new BO_Pla_Partida();
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
public static string[] acxPla_Partida_GetByLikeNombre_List (string prefixText, int count, string contextKey)
{
    Scope s = (Scope)HttpContext.Current.Session["Scope"];
    FEL.PLA.BO_Pla_Partida adp = new BO_Pla_Partida();
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
    AjaxControlToolkit.AutoCompleteExtender acxPla_Partida_CodigoTextBox = new AjaxControlToolkit.AutoCompleteExtender();
    AjaxControlToolkit.AutoCompleteExtender acxPla_Partida_NombreTextBox  = new AjaxControlToolkit.AutoCompleteExtender();
    switch (fvPla_Tarea.CurrentMode)
    {
        case FormViewMode.Insert:
            // Pone el año en el autocompletar
            acxPla_Partida_CodigoTextBox = (AjaxControlToolkit.AutoCompleteExtender)fvSender.FindControl(acxPla_Partida_CodigoTextBox);
            acxPla_Partida_CodigoTextBox.ContextKey = ddlCabecera.SelectedValue;
            acxPla_Partida_NombreTextBox = (AjaxControlToolkit.AutoCompleteExtender)fvSender.FindControl(acxPla_Partida_NombreTextBox);
            acxPla_Partida_NombreTextBox.ContextKey = ddlCabecera.SelectedValue;
            break;
        case FormViewMode.Edit:
            // Pone el año en el autocompletar
            acxPla_Partida_CodigoTextBox = (AjaxControlToolkit.AutoCompleteExtender) fvSender.FindControl(acxPla_Partida_CodigoTextBox);
            acxPla_Partida_CodigoTextBox.ContextKey = ddlCabecera.SelectedValue;
            acxPla_Partida_NombreTextBox = (AjaxControlToolkit.AutoCompleteExtender)fvSender.FindControl(acxPla_Partida_NombreTextBox);
            acxPla_Partida_NombreTextBox.ContextKey = ddlCabecera.SelectedValue;
            break;
        case FormViewMode.ReadOnly:
            break;
    }
}