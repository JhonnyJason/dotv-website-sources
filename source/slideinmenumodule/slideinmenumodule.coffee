############################################################
#region debug
import { createLogFunctions } from "thingy-debug"
{log, olog} = createLogFunctions("slideinmenumodule")
#endregion

############################################################
#region internalVariables
slideinButton = null

############################################################
menuIsHere = false
hidden = true

#endregion

############################################################
export initialize = ->
    log "slideinmenumodule.initialize"
    slideinButton = document.getElementById("slidein-button")
    slideinButton.addEventListener("click", toggleMenuHere)
    return

############################################################
toggleMenuHere = ->
    if menuIsHere
        slideinButton.classList.remove("menu-here")
        slideinmenu.classList.remove("here")    
        menuIsHere = false
    else
        slideinButton.classList.add("menu-here")
        slideinmenu.classList.add("here")    
        menuIsHere = true
    return

############################################################
export hide = ->
    return if hidden
    slideinButton.classList.remove("here")
    slideinButton.classList.remove("menu-here")
    slideinmenu.classList.remove("here")
    menuIsHere = false
    hidden = true
    return

############################################################
export show = ->
    return unless hidden
    slideinButton.classList.add("here")
    slideinButton.classList.remove("menu-here")
    slideinmenu.classList.remove("here")
    menuIsHere = false
    hidden = false
    return
