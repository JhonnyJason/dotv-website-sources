upbuttonmodule = {name: "upbuttonmodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["upbuttonmodule"]?  then console.log "[upbuttonmodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

############################################################
v = null

timerID = 0
timeoutMS = 1000

shown  = false

############################################################
upbuttonmodule.initialize = () ->
    log "upbuttonmodule.initialize"
    v = allModules.vanillautilmodule
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
upbuttonmodule.show = ->
    return if shown
    upbuttonContainer.classList.add("here")
    shown = true
    return

upbuttonmodule.hide = ->
    return unless shown
    upbuttonContainer.classList.remove("here")
    shown = false
    return

module.exports = upbuttonmodule