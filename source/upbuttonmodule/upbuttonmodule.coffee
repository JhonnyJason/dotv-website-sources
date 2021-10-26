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

############################################################
upbuttonmodule.initialize = () ->
    log "upbuttonmodule.initialize"
    v = allModules.vanillautilmodule
    upbutton.addEventListener("click", scrollToTop)
    return
    
############################################################
scrollToTop = (evt) ->
    v.scrollTo(0)
    return

############################################################
upbuttonmodule.show = ->
    upbuttonContainer.classList.add("here")
    return

upbuttonmodule.hide = ->
    upbuttonContainer.classList.remove("here")
    return

module.exports = upbuttonmodule