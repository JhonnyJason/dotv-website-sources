import Modules from "./allmodules"
import domconnect from "./networkdomconnect"
domconnect.initialize()

global.allModules = Modules

utl = Modules.utilmodule


############################################################
appStartup = ->
    return

############################################################
run = ->
    promises = (m.initialize() for n,m of Modules when m.initialize?)
    await Promise.all(promises)
    appStartup()

############################################################
run()
