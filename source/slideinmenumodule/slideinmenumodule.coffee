slideinmenumodule = {name: "slideinmenumodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["slideinmenumodule"]?  then console.log "[slideinmenumodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion


############################################################
slideinButton = null

menuIsHere = false
hidden = true

############################################################
slideinmenumodule.initialize = ->
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
slideinmenumodule.hide = ->
    return if hidden
    slideinButton.classList.remove("here")
    slideinButton.classList.remove("menu-here")
    slideinmenu.classList.remove("here")
    menuIsHere = false
    hidden = true
    return

############################################################
slideinmenumodule.show = ->
    return unless hidden
    slideinButton.classList.add("here")
    slideinButton.classList.remove("menu-here")
    slideinmenu.classList.remove("here")
    menuIsHere = false
    hidden = false
    return

module.exports = slideinmenumodule