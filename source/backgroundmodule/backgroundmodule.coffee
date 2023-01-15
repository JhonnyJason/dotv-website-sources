############################################################
#region debug
import { createLogFunctions } from "thingy-debug"
{log, olog} = createLogFunctions("backgroundmodule")
#endregion

############################################################
export initialize = ->
    log "initialize"
    return
    