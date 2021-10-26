import Modules from "./allmodules"
import domconnect from "./indexdomconnect"
domconnect.initialize()

global.allModules = Modules

counter = 0
releaseId = 0

############################################################
contract = ->
    backgroundlogo.classList.add("small")
    return

release = ->
    backgroundlogo.classList.remove("small")
    return

evaluate = ->
    if counter > 100
        contract()
        if releaseId then clearTimeout(releaseId)
        releaseId = setTimeout(release, 2000)
    counter = 0
    return


moved = -> counter++

############################################################
appStartup = ->
    document.addEventListener("mousemove", moved)
    setInterval(evaluate, 1000)
    return

############################################################
run = ->
    promises = (m.initialize() for n,m of Modules when m.initialize?) 
    await Promise.all(promises)
    appStartup()

############################################################
run()