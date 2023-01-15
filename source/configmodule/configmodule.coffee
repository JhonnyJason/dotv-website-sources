############################################################
#region debug
import { createLogFunctions } from "thingy-debug"
{log, olog} = createLogFunctions("configmodule")
#endregion

########################################################
export initialize = ->
    log "initialize"
    return    

########################################################
export prop = true

