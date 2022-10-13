import Modules from "./allmodules"
import domconnect from "./indexdomconnect"
domconnect.initialize()

global.allModules = Modules

############################################################
appStartup = -> return

############################################################
run = ->
    promises = (m.initialize() for n,m of Modules when m.initialize?) 
    await Promise.all(promises)
    appStartup()

############################################################
run()