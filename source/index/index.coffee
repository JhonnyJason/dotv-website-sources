import Modules from "./allmodules"
import domconnect from "./indexdomconnect"
domconnect.initialize()

global.allModules = Modules

############################################################
emailLink = document.getElementById("email-link")
linkSet = false

############################################################
createEmailLink = (evnt) ->
    if linkSet then return true
    else evnt.preventDefault()
    domain = "dotv"
    tld = "ee"
    nameY = "con"
    nameX = "tact"
    mailAddress = nameY+nameX+"@"+domain+"."+tld
    href = "mailto:"+mailAddress
    emailLink.setAttribute("href", href)
    emailLink.textContent = "here: "+mailAddress
    linkSet = true
    return

############################################################
appStartup = -> 
    emailLink.addEventListener("click", createEmailLink)
    return

############################################################
run = ->
    promises = (m.initialize() for n,m of Modules when m.initialize?) 
    await Promise.all(promises)
    appStartup()

############################################################
run()