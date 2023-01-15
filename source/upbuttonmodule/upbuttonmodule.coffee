############################################################
#region debug
import { createLogFunctions } from "thingy-debug"
{log, olog} = createLogFunctions("upbuttonmodule")
#endregion

############################################################
import * as v from "./vanillautilmodule.js"

############################################################
#region internal variables
timerID = 0
timeoutMS = 1000

############################################################
shown  = false

#endregion

############################################################
export initialize = ->
    log "initialize"
    upbutton.addEventListener("click", scrollToTop)
    return
    
############################################################
scrollToTop = (evt) ->
    v.scrollTo(0)
    backgroundlogo.classList.add("big-and-clear")
    if timerID then clearTimeout(timerID)
    timerID = setTimeout(clearBackground, timeoutMS)
    return

clearBackground = ->
    backgroundlogo.classList.remove("big-and-clear")
    return

############################################################
export show = ->
    return if shown
    upbuttonContainer.classList.add("here")
    shown = true
    return

export hide = ->
    return unless shown
    upbuttonContainer.classList.remove("here")
    shown = false
    return
