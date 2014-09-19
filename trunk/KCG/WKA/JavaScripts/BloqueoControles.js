// KoalaSolution
// Inabilitar controles en postBacks, los controles cuyo id
// comience con _prefijoIdGrid no serán bloqueados
// Autor: Adrián Armijos 

 var _tickHandler = null;
    var _timer = null;
    var _trackPositionDelay = 8000;
    var _prefijoIdGrid = "ctl00_ContentPlaceHolder1_gv";
    var _esGrid;
    
    
    function pageLoad() {
        var manager = Sys.WebForms.PageRequestManager.getInstance();
        manager.add_beginRequest(OnBeginRequest);
        manager.add_endRequest(OnEndRequest);
    }
    
    function OnBeginRequest(sender, args) {
        var elemento = args.get_postBackElement();
        _esGrid = VerificarIdGrid(elemento.id, _prefijoIdGrid);
        if(!_esGrid)
        {
            elemento.parentNode.disabled = true;
        }
        startTimer();
    }
    
    function OnEndRequest(sender, args) {
        stopTimer();
        $find("Cargando").hide();
    }
    
    function VerificarIdGrid(Id, prefix) {
        return Id.startsWith(prefix.toString());
    }

    function onTimerTick ()  {    
        $find("Cargando").show();
        stopTimer();
    }

    function startTimer ()  {
        if (!_timer) {
            if (!_tickHandler) {
                _tickHandler = Function.createDelegate(this, onTimerTick);
            }
            _timer = new Sys.Timer();
            _timer.set_interval(_trackPositionDelay);
            _timer.add_tick(_tickHandler);
            _timer.set_enabled(true);
        }
    }

    function stopTimer ()   {
        if (_timer) {
            _timer.remove_tick(_tickHandler);
            _timer.set_enabled(false);
            _timer.dispose();
            _timer = null;
        }
    }