backgroundmodule = {name: "backgroundmodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["backgroundmodule"]?  then console.log "[backgroundmodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

############################################################
backgroundmodule.initialize = () ->
    log "backgroundmodule.initialize"
    return
    
module.exports = backgroundmodule